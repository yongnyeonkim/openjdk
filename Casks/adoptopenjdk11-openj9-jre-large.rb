# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk11-openj9-jre-large" do
  version "11.0.10,9"
  sha256 "aa3ddeea193e262c65aade918cce16d31fa7cc883000d36867c55f316fc3ac55"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-11.0.10%2B9_openj9-0.24.0/OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.10_9_openj9-0.24.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/tag/jdk-11.0.10%2B9_openj9-0.24.0"
  name "AdoptOpenJDK 11 (OpenJ9) (JRE) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.10_9_openj9-0.24.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.11-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.11-openj9.jre"

  caveats do
    discontinued

    <<~EOS
      Large Heap Casks have now been deprecated. Please use the Normal Heap Casks instead.
      See https://github.com/AdoptOpenJDK/openjdk-build/issues/2426 for more information.
    EOS
  end
end
