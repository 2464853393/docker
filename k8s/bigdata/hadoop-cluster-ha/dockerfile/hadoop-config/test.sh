for f in core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml; do
  if [[ -e ./$f ]]; then
    cp ./$f ./etc/hadoop/$f
  else
    echo "ERROR: Could not find $f in here"
    exit 1
  fi
done

