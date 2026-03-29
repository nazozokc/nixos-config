{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # ブートローダー
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ホスト名
  networking.hostName = "nixos";

  # タイムゾーン
  time.timeZone = "Asia/Tokyo";

  # ユーザー設定
  users.users.nazozo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # sudo使えるように
    shell = pkgs.fish;
  };

  # システムワイドなパッケージ
  environment.systemPackages = with pkgs; [
    neovim
    git
    ghq
    github-cli
    fish
  ];

  # fish を有効化
  programs.fish.enable = true;

  system.stateVersion = "24.11";
}
