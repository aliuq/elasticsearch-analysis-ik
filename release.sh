#! /bin/bash
set -e

read -p "Enter the version number: " VERSION

if [ $VERSION ]; then
  sed -i "s/<elasticsearch\.version>.*<\/elasticsearch\.version>/<elasticsearch\.version>$VERSION<\/elasticsearch\.version>/" pom.xml
  git add pom.xml
  git commit -m "Support version v$VERSION"
  git tag --annotate --message "v$VERSION" v$VERSION
  git push
  git push --tags
fi

# reset the version number
# git reset --hard HEAD~1
# git tag -d "v$VERSION"
# git push -f
# git push origin ":refs/tags/v$VERSION"
