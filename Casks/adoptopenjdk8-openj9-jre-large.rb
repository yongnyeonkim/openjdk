# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk8-openj9-jre-large" do
  version "8,282:b08"
  sha256 "779400854c10121f35465160df34e9e0c4cee6a036beaffd5d4245206ab37345"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.csv.first}-binaries/releases/download/jdk8u282-b08_openj9-0.24.0/OpenJDK8U-jre_x64_mac_openj9_macosXL_8u282b08_openj9-0.24.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/adoptopenjdk/openjdk8-binaries/releases/latest"
  name "AdoptOpenJDK 8 (OpenJ9) (JRE) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jre_x64_mac_openj9_macosXL_8u282b08_openj9-0.24.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8-openj9.jre"

  caveats do
    discontinued

    <<~EOS
      Large Heap Casks have now been deprecated. Please use the Normal Heap Casks instead.
      See https://github.com/AdoptOpenJDK/openjdk-build/issues/2426 for more information.
    EOS
  end
end
