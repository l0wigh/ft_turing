all:
	@dune build

run:
	@dune exec ft_turing_dune

fclean:
	@dune clean

re: fclean all
