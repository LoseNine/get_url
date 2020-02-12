-module(get_url).
-compile(export_all).

process(InFilename,OutFilename)->
    case file:open(InFilename,read) of 
        {ok,Content}->
            io:format("open file success!~n"),
            Result=readFile(Content),
            {ok,Outfile}=file:open(OutFilename,[append]),
            write_to_file(Result,Outfile);
        {error,Reason}->
            Reason
end.


write_to_file([],Outfile)->
    io:format("write all data in~n"),
    file:close(Outfile);
write_to_file([H|T],Outfile)->
    io:format(Outfile,"~s~n",[H]),
    write_to_file(T,Outfile).

readFile(Content)->
    readFile(Content,[]).

readFile(Content,Result)->
    Line=io:get_line(Content,""),
    case Line of 
        eof->
            io:format("read file eof!~n"),
            file:close(Content),
            Result;
        Data->
            Tokens=string:tokens(Data," \" "),
            io:format("~p~n",[Tokens]),
            Number=getListHref(Tokens),
            case Number of 
                false->
                    readFile(Content,Result);
                Number->
                    % io:format("url number is ~w~n",[Number]),
                    Url=lists:nth(Number,Tokens),
                    io:format("url is ~s~n",[Url]),
                    % io:format("----------~n"),
                    readFile(Content,[Url|Result])
            end;
            
        {errro,_Reason}->
            io:format("read line error!~n")
    end.


equal(S,S)->true;
equal(_,_)->false.

getListHref(Tokens)->getListHref(Tokens,1).
getListHref([],_N)->false;
getListHref([H|T],N)->
       case equal(H,"href=") of
            true->
               N+1;
            false->
                getListHref(T,N+1)
        end.
