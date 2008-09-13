# $Id: 10pod.t 78 2008-09-13 10:12:34Z cfaerber $

use strict;
use Test::More;

eval "use Test::Pod 1.00";
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;

all_pod_files_ok();
