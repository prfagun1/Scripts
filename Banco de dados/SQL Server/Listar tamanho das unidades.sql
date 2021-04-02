Select e.name, 
       vm.path, 
       CAST(vm.capacity AS money) / (1024 * 1024 * 1024) AS Capacity_GB, 
       CAST(vm.free_space AS money) / (1024 * 1024 * 1024) AS Free_GB  from
  vmware_HU.dbo.VPX_ENTITY e JOIN
vmware_HU.dbo.vpx_guest_disk vm ON e.id = vm.vm_id

union 

Select e.name, 
       vm.path, 
       CAST(vm.capacity AS money) / (1024 * 1024 * 1024) AS Capacity_GB, 
       CAST(vm.free_space AS money) / (1024 * 1024 * 1024) AS Free_GB  from
  vmware_sede.dbo.VPX_ENTITY e JOIN
vmware_sede.dbo.vpx_guest_disk vm ON e.id = vm.vm_id

Order by 4 desc