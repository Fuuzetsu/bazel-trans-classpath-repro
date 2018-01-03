let pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/4026ea9c8afd09b60896b861a04cc5748fdcdfb4.tar.gz") {};
in pkgs.stdenv.mkDerivation {
  name = "bazel-repro-env";
  src = null;
  buildInputs = [ pkgs.bazel ];
}
