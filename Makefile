# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bapasqui <bapasqui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/04 18:18:39 by bapasqui          #+#    #+#              #
#    Updated: 2024/06/27 23:14:19 by bapasqui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef VERBOSE
MAKEFLAGS += --no-print-directory --silent
endif

RED				:= \033[0;31m
BRED			:= \033[1;31m
BLINK_GREEN		:= \033[5;32m
BGREEN			:= \033[1;32m
BHYEL			:= \033[1;93m
BOLD			:= \033[1m
NC				:= \033[0m

NAME := compta-csv
CC := clang
CFLAGS := -Wextra -Wall -Werror -gdwarf-4

SRCS	= src/main.c 

SRC_DIR := src
OBJS_DIR := obj
OBJS    := $(addprefix $(OBJS_DIR)/,$(SRCS:.c=.o))
LIBFT_DIR = libft_plus
LIBFT_TARGET = $(LIBFT_DIR)/libft.a

all: $(NAME) 
	@echo "\n\t$(BGREEN)$(NAME) = COMPILATION FINISHED !$(NC)\n"

$(OBJS_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -o $@ -c $< $(HEADERS)  && echo "$(BGREEN)[✔]$(NC)\tCompiling:\t$(BOLD)$(notdir $<)$(NC)"
	
$(LIBFT_TARGET):
	make -C $(LIBFT_DIR)

$(NAME): $(LIBFT_TARGET) init $(OBJS) 
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LIBFT_TARGET) -lreadline
	
clean:
	rm -rf $(OBJS_DIR)
	make -C $(LIBFT_DIR) clean

fclean: clean
	rm -rf $(NAME)
	rm -rf tester/src/__pycache__
	make -C $(LIBFT_DIR) fclean
	rm -rf minishell-tester
	rm -rf outfile
	rm -rf infile
	echo "\033[41m$(NAME) cleaned\033[0m"

init:
	@echo ""
	@echo "\t\t$(BHYEL)┍━━━━━━━━━»•» 🌸  «•«━┑$(NC)"
	@echo "\t\t$(BHYEL) MINISHELL COMPILATION $(NC)"
	@echo "\t\t$(BHYEL)┕━»•» 🌸  «•«━━━━━━━━━┙$(NC)"
	@echo ""

re: fclean all

.PHONY: all clean fclean re