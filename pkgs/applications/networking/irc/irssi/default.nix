{ lib
, stdenv
, fetchFromGitHub
, glib
, libgcrypt
, libintl
, libotr
, libtool
, meson
, ncurses
, ninja
, openssl
, perl
, pkg-config
}:

stdenv.mkDerivation rec {
  pname = "irssi";
  version = "1.4.1";

  src = fetchFromGitHub {
    owner = "irssi";
    repo = "irssi";
    rev = version;
    hash = "sha256-HLcIhAZoJfCHoSNQCpoytBR0zmiZd919FcKWCl35G0A=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    glib
    libgcrypt
    libintl
    libotr
    ncurses
    openssl
    perl
  ];

  configureFlags = [
    "-Dwith-proxy=yes"
    "-Dwith-bot=yes"
    "-Dwith-perl=yes"
  ];

  meta = with lib; {
    description = "Terminal based IRC client";
    homepage = "https://irssi.org";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ fab lovek323 ];
    platforms = platforms.unix;
  };
}
