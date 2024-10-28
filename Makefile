all:
	@dune build
	@cp ./_build/default/bin/main.exe ./ft_turing
	@chmod 777 ./ft_turing

run:
	@dune exec ft_turing_dune

fclean:
	@dune clean
	@rm ./ft_turing

re: fclean all
