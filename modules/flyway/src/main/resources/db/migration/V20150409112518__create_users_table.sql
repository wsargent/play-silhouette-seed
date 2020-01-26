CREATE TABLE `USERS` (
  `USER_ID`      UUID DEFAULT RANDOM_UUID()  NOT NULL PRIMARY KEY,
  `FIRST_NAME`   VARCHAR(255),
  `LAST_NAME`    VARCHAR(255),
  `EMAIL`        VARCHAR(255),
  `AVATAR_URL`   VARCHAR(255),
  ACTIVATED      BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE `USER_PROFILES` (
  `USER_ID`      UUID NOT NULL REFERENCES `USERS`(`USER_ID`),
  `PROVIDER_ID`  VARCHAR(255) NOT NULL,
  `PROVIDER_KEY` VARCHAR(255) NOT NULL,

  PRIMARY KEY (`PROVIDER_ID`, `PROVIDER_KEY`)
);

CREATE TABLE `PASSWORDS` (
  `AUTH_KEY` VARCHAR(255) NOT NULL PRIMARY KEY REFERENCES `USER_PROFILES`(`PROVIDER_KEY`),
  `HASHER`   VARCHAR(255)         NOT NULL,
  `HASH`     VARCHAR(255)         NOT NULL,
  `SALT`     VARCHAR(255)
);