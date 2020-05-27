NAME				= SystemCUnit
GXX             	= g++
GCC             	= gcc
SRCS 				= $(shell ls -r sources/*.cpp)
OBJS				= $(SRCS:.cpp=.o)
INCLUDE_MAIN		= ./includes/$(NAME).h
INCLUDES			= -I./includes 
RM					= rm -rf
AR					= ar -rcs
SESSION_FILE    	= Session.vim
BUILD_NUMBER		= .build_number
VERSION_NUMBER		= .version_number
CURRENT_VERSION		= $(shell cat $(VERSION_NUMBER))
CURRENT_BUILD		= $(shell cat $(BUILD_NUMBER))
BUILD_DATE			= $(shell stat -f "%Sm" -t "%Y-%m-%d %H:%M" $(BUILD_NUMBER))
CFLAGS				= -D NAME="\"$(NAME)\"" -D VERSION="\"$(CURRENT_VERSION)\"" -D BUILD="\"$(CURRENT_BUILD)\"" -D BUILD_DATE="\"$(BUILD_DATE)\"" -D DESC="\"$(DESC)\"" $(INCLUDES) -Weverything -lsystemc
.PREFIXES:


all: 				$(NAME)


$(NAME): 			$(OBJS)
	$(AR) $(NAME).a $(OBJS)


sources/scu_test.o : sources/scu_global_state.o
sources/scu_suite.o : sources/scu_global_state.o
sources/scu_suite.o : sources/scu_test.o

%.o: 				%.cpp $(INCLUDE_MAIN)
	$(GXX) $(CFLAGS) -c $< -o $@

clean:
	$(RM) *.o

fclean:				clean
	$(RM) $(NAME)

re: clean fclean all                                                                    


run: 				$(NAME)
	./$(NAME)

test:				ctest
	./$(TEST)

reset_version:
	echo 0  > $(VERSION_NUMBER)

new_version:
	bc <<< "${CURRENT_VERSION}+1" > $(VERSION_NUMBER)

reset_build:
	echo 1  > $(BUILD_NUMBER)

new_build:			$(SRCS) $(INCLUDE_MAIN)
	bc <<< "${CURRENT_BUILD}+1" > $(BUILD_NUMBER)

push:				new_build
	git push origin master

vi:
	nvim -S $(SESSION_FILE)

.PHONY:				all run $(NAME) clean fclean re vi

.SUFIXES:
























