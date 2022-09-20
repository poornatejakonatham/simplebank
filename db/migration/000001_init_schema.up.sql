-- accounts table to store user accounts.
CREATE TABLE accounts
(
    id BIGSERIAL PRIMARY KEY,
    owner VARCHAR NOT NULL, -- Owner name.
    balance BIGINT NOT NULL,
    currency VARCHAR NOT NULL, -- INR, USD etc.
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX ON accounts (owner);

-- entries table to store user self transactions.
CREATE TABLE entries
(
    id BIGSERIAL PRIMARY KEY,
    account_id BIGINT NOT NULL,
    amount BIGINT NOT NULL, -- Positive or negative.
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX ON entries (account_id);

-- transfers table to store transactions between two users.
CREATE TABLE transfers
(
    id BIGSERIAL PRIMARY KEY,
    from_account_id BIGINT NOT NULL,
    to_account_id BIGINT NOT NULL,
    amount BIGINT NOT NULL, -- Positive only.
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX ON transfers (from_account_id);
CREATE INDEX ON transfers (to_account_id);
CREATE INDEX ON transfers (from_account_id, to_account_id);
