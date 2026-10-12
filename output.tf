output "vms" {
  value = {
    for name, vm in yandex_compute_instance.vm : vm.name => vm.network_interface.0.nat_ip_address
  }
}

output "lb" {
  value = {
    for listener in yandex_lb_network_load_balancer.balancer1.listener : listener.name => [
      for spec in listener.external_address_spec : spec.address
    ]
  }
}
