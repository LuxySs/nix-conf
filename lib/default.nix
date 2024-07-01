{ lib }:

{
  mkIfCoucou = word: codeBlock: if word == "coucou" then codeBlock else {};
}
