with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "inventory2-bundler-env";
    inherit ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "inventory2";
  buildInputs = [
    env
    zlib
    sqlite
    bundix
    postgresql
  ];
}
