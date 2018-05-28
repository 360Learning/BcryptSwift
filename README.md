# BcryptSwift

## Introduction

A standalone Bcrypt algorithm in Swift.

This project is a quick adaptation from the already adapted bcrypt algorithm from Joe Kramer: https://github.com/meanjoe45/JKBCrypt. It works well for our own usage but it's not extensively tested. Any contribution is welcome.

## How to use

To use it, just copy the 2 files into your project. Or import it as a dynamic framework.

Then use:

`JKBCrypt.hashPassword(password: "password", withSalt: JKBCrypt.generateSalt())`
`JKBCrypt.verifyPassword(password: "password", matchesHash: "hash")`
