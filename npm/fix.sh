import require_package
import print.print

function npm.fix() {
  require_package npm
  npm config ls -l | grep $USER
  print yellow 'Should point to a local dir:\n'
  npm config get cache
  print 'npm config set cache <local_abs_path> --global\n'
  print yellow ' * Fix these config variables!\n'
}
