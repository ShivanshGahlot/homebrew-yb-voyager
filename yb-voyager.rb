class YbVoyager < Formula
  desc "YugabyteDB's migration tool"
  homepage "https://github.com/yugabyte/yb-voyager/"
  url "https://github.com/yugabyte/yb-voyager/archive/refs/tags/yb-voyager/v1.0.0-xbeta.0.tar.gz"
  sha256 "f861453ff4b87c05cad5660dbd6997c8b758e4d9235b49b582937f6aee917c90"
  license "ASL 2.0"

  depends_on "go" => :build
  depends_on "libpq"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    Dir.chdir('yb-voyager')
    system "go", "build"
    bin.install "yb-voyager"
  end

  test do
    system "#{bin}/yb-voyager", "--help"
  end
end
