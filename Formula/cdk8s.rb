require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.0.tgz"
  sha256 "67287ea387c6890c62b449ce9cc8089bb3e2dbe0e462c44e3e1c4288b15ac0f1"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "b4efe991bbef2d4bd3d07639cb783cadc531c1bfe32aeb408efa1f71c98cb611"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
