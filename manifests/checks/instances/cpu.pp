#
# configure monasca plugin yaml file for cpu interfaces
#
define monasca::checks::instances::cpu (
  $send_rollup_stats = undef,
  $dimensions        = undef,
) {
  $conf_dir = $::monasca::agent::conf_dir
  concat::fragment { "${title}_cpu_instance":
    target  => "${conf_dir}/cpu.yaml",
    content => template('monasca/checks/cpu.erb'),
    order   => '1',
  }
}
