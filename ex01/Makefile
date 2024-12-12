NAME := a.out

SRCS := $(wildcard *.cpp)
OBJS := $(SRCS:.cpp=.o)
CXXFLAGS += -Wall -Wextra -Werror -O0 -g -std=c++98 -pedantic-errors

.PHONY: all
all: $(NAME)

$(NAME): $(OBJS)
	$(CXX) $(OBJS) -o $(NAME)

.PHONY: clean
clean:
	$(RM) $(OBJS)

.PHONY: fclean
fclean: clean
	$(RM) $(NAME)

.PHONY: re
re: fclean all
