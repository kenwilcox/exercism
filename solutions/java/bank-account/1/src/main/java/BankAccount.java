class BankAccount {
    private int balance = 0;
    private boolean closed = true;

    private Object balance_lock = new Object();
    
    void open() throws BankAccountActionInvalidException {
        if (!this.closed) throw new BankAccountActionInvalidException("Account already open");
        this.closed = false;
    }

    void close() throws BankAccountActionInvalidException {
        if (this.closed) throw new BankAccountActionInvalidException("Account not open");
        this.closed = true;
        this.balance = 0;
    }

    synchronized int getBalance() throws BankAccountActionInvalidException {
        synchronized(this.balance_lock) {
            if (this.closed) throw new BankAccountActionInvalidException("Account closed");
            return this.balance;
        }
    }

    synchronized void deposit(int amount) throws BankAccountActionInvalidException {
        if (amount < 0) throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        synchronized(this.balance_lock) {
            if (this.closed) throw new BankAccountActionInvalidException("Account closed");
            this.balance += amount;
        }
    }

    synchronized void withdraw(int amount) throws BankAccountActionInvalidException {
        if (amount < 0) throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        synchronized(this.balance_lock) {
            if (this.closed) throw new BankAccountActionInvalidException("Account closed");
            if (this.balance < amount) throw new BankAccountActionInvalidException("Cannot withdraw more money than is currently in the account");
            this.balance -= amount;
        }
    }

}