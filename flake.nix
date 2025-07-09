{
  inputs = {
    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
  };
  outputs = { nixvim, ... }: {
    nixosModules.nixvim = {
      imports = [
        nixvim.nixosModules.nixvim
        ./nixosModules/nixvim
      ];
    };
  };
}
