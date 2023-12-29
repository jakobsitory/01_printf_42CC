NAME = libftprintf.a
LIBFTNAME = libft.a
SRC = ft_printf.c ft_printc.c \
		ft_prints.c ft_printi.c ft_printu.c \
		ft_printp.c ft_printx.c
OBJS = $(SRC:.c=.o)
LIBFTDIR = ./libft
FT_FLAGS = -Wextra -Werror -Wall

.PHONY: all clean fclean re

all: $(NAME)

makelibft:
	make -C $(LIBFTDIR)
	cp $(LIBFTDIR)/$(LIBFTNAME) .
	mv $(LIBFTNAME) $(NAME)

$(NAME): makelibft $(OBJS)
	ar -crs $(NAME) $(OBJS)

%.o: %.c ft_printf.h
	cc $(FT_FLAGS) -c $< -o $@

clean:
	@/bin/rm -f $(OBJS)
	@cd $(LIBFTDIR) && make clean

fclean: clean
	@/bin/rm -f $(NAME)
	@cd $(LIBFTDIR) && make fclean

re: fclean all
