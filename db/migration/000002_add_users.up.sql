CREATE TABLE "users" (
  "user_name" varchar PRIMARY KEY,
  "hashed_password" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password_changed_at" timestamptz NOT NULL DEFAULT '0001-01-01 00:00:00Z',
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

ALTER TABLE "accounts" ADD FOREIGN KEY ("user_name") REFERENCES "users" ("user_name");

-- CREATE UNIQUE INDEX ON "accounts" ("user_name", "currency");
ALTER TABLE "accounts" ADD CONSTRAINT "user_name_currency_key" UNIQUE ("user_name", "currency");