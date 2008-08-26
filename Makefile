MAIN=myhello

LFE_PATH=${HOME}/lfe/ebin/



all: ${MAIN}.beam

${MAIN}.beam:
	@erl -noshell -pa ${LFE_PATH} -eval 'code:load_file(lfe_comp).' -eval 'case lfe_comp:file(hd(init:get_plain_arguments())) of {error,X,AR} -> io:format("~p~n",[X]), halt(1) ; {ok,X,AR} -> io:format("~p ~p~n",[X,AR]), halt(0) end.' -extra ${MAIN}.lfe

start: ${MAIN}.beam
	@erl -noshell -pa ${LFE_PATH} -eval 'code:load_file(${MAIN}).' -eval '${MAIN}:start().' -s erlang halt

clean:
	@rm -f *.beam *.dump
