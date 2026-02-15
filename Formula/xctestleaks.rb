class Xctestleaks < Formula
  desc "Memory leak detection tool for iOS XCTest"
  homepage "https://github.com/amanjeetsingh150/XCTestLeaks"
  url "https://github.com/amanjeetsingh150/XCTestLeaks/releases/download/v0.1.5/xctestleaks.tar"
  sha256 "a52d319a7b0fe9ac72caf70ecaabf0d5aaa51c6ef3ced57718896cdedbdde6a9"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]

    # Rewrite the shell wrapper to use Homebrew's JDK
    (bin/"xctestleaks").write_env_script(
      libexec/"bin/xctestleaks",
      JAVA_HOME: Formula["openjdk"].opt_prefix
    )
  end

  test do
    assert_match "xctestleaks 0.1.4", shell_output("#{bin}/xctestleaks --version")
  end
end