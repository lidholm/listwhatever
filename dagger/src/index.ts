/**
 * A generated module for Listwhatever functions
 *
 * This module has been generated via dagger init and serves as a reference to
 * basic module structure as you get started with Dagger.
 *
 * Two functions have been pre-created. You can modify, delete, or add to them,
 * as needed. They demonstrate usage of arguments and return types using simple
 * echo and grep commands. The functions can be called from the dagger CLI or
 * from one of the SDKs.
 *
 * The first line in this comment block is a short description line and the
 * rest is a long description with more detail on the module's purpose or usage,
 * if appropriate. All modules should have a short description.
 */
import { dag, Container, Directory, object, func } from "@dagger.io/dagger"

@object()
class Listwhatever {
    /**
   * Return the result of running unit tests
   */
    @func()
    async test(source: Directory): Promise<string> {
      return this.buildEnv(source)
        .withExec(["ls"])
        .stdout()
    }
  
    /**
     * Build a ready-to-use development environment
     */
    @func()
    buildEnv(source: Directory): Container {
      const nodeCache = dag.cacheVolume("n tode")
      return dag
        .container()
        .from("node:21-slim")
        .withDirectory("/src", source,
          { exclude: [
              "LICENSE",
              "README.md",
              "android/.gradle",
              "android/.idea",
              "build",
              "build.yaml",
              "bundletool-all.jar",
              "coverage_badge.svg",
              "custom_lint.log",
              "dagger",
              "dagger.json",
              "deploy",
              "docs",
              "emulatorData",
              "extensions",
              "firebase-debug.log",
              "firebase-deploy-service-account.json",
              "firebase.json",
              "firestore-debug.log",
              "firestore.indexes.json",
              "firestore.rules",
              "flutter_01.log",
              "flutter_02.log",
              "functions",
              "ios",
              "key.txt",
              "l10n.yaml",
              "lib",
              "listwhatever.iml",
              "macos",
              "node_modules",
              "package-lock.json",
              "privacypolicy.txt",
              "pubspec.lock",
              "pubspec.yaml",
              "pubsub-debug.log",
              "remoteconfig.template.json",
              "screenshots",
              "scripts",
              "secrets",
              "storage.rules",
              "terraform",
              "test",
              "todo.md",
              "todos.md",
              "ui-debug.log",
              "web",
              "windows",
          ]})
        .withWorkdir("/src")
        .withExec(["echo","hello"])
    }
}
