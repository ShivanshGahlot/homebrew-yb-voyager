class YbVoyager < Formula
  desc "YugabyteDB's migration tool"
  homepage "https://github.com/yugabyte/yb-voyager/"
  url "https://github.com/yugabyte/yb-voyager/archive/master.tar.gz"
  sha256 "c3a9064c2a6b0082e93883c0524dabf50b6d7284f7451b80f44a9e79e9235216"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "libpq"

  def install
    ENV.deparallelize
    Dir.chdir("yb-voyager") do
      system "go", "build"
      bin.install "yb-voyager"
    end
  end

  test do
    system "#{bin}/yb-voyager", "--help"
  end
end
