[zs_lic]: https://raw.github.com/nickma/appdirector-solutions/master/Zend_ZendServer_Clustered_Beta/zs_installer.png 
[zs_order]: https://raw.github.com/vmware-applicationdirector/solutions-import-beta/weblogic_cluster/wl_so.png 

## Success
Your application has been successfully imported and ready to go but first there are a few final steps you need to follow before you can perform a deployment.

### Next Steps
1. In Zend Server Service, you will need to ensure that you have configured the **zend_license_key** , **zend_order_number** properties to match your current or trial license key and order number. 
You can find your current Zend Server licenses at our website. http://www.zend.com/myzend or request a trial license at http://www.zend.com/en/products/server/server-6-beta   
[![Zend Server Installer][zs_lic]][zs_lic]


2. You will need to configure the **mod_wl_so** content property in the Apache script as displayed to point to where you have it located. This can be obtained as an Oracle download from their site. http://www.oracle.com/technetwork/middleware/ias/downloads/wls-plugins-096117.html
[![Apache WebLogic Plugin][wl_so]][wl_so]

##### After this you good to go.
