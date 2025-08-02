-module(bank_account).
-behaviour(gen_server).
-export([balance/1, charge/2, close/1, create/0, deposit/2, withdraw/2]).
-export([init/1, handle_call/3, handle_cast/2]).

-record(account, {state = open, balance = 0}).

create() ->
  {ok, Pid} = gen_server:start_link(?MODULE, [], []),
  Pid.

balance(_Pid) ->
  gen_server:call(_Pid, balance).

charge(_Pid, _Amount) ->
  gen_server:call(_Pid, {charge, _Amount}).

close(_Pid) ->
  gen_server:call(_Pid, close).

deposit(_Pid, _Amount) ->
  gen_server:cast(_Pid, {deposit, _Amount}).

withdraw(_Pid, _Amount) ->
  gen_server:call(_Pid, {withdraw, _Amount}).

% Server bits
init([]) -> {ok, #account{}}.

handle_call(_, _, Account) when Account#account.state == closed ->
  {reply, {error, account_closed}, Account};
handle_call(close, _From, Account) ->
  {reply, Account#account.balance, Account#account{state = closed}};
handle_call(balance, _From, Account) ->
  {reply, Account#account.balance, Account};
handle_call({withdraw, Amount}, _From, Account) ->
  Balance = Account#account.balance,
  if
    Amount < 0 ->
      {reply, 0, Account};
    Amount > Balance ->
      {reply, Balance, Account#account{balance = 0}};
    true ->
      {reply, Amount, Account#account{balance = Balance - Amount}}
  end;
handle_call({charge, Amount}, _From, Account) ->
  Balance = Account#account.balance,
  if
    Amount < 0 ->
      {reply, 0, Account};
    Amount > Balance ->
      {reply, 0, Account};
    true ->
      {reply, Amount, Account#account{balance = Balance - Amount}}
  end.

handle_cast(_, Account) when Account#account.state == closed ->
  {noreply, Account};
handle_cast({deposit, Amount}, Account) ->
  if
    Amount < 0 ->
      {noreply, Account};
    true ->
      {noreply, Account#account{balance = Account#account.balance + Amount}}
  end.
