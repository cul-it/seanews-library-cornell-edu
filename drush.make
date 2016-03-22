;; drush make file for seanews
;;

core = 7.x
api = 2
projects[drupal][version] = "7.43"
projects[drupal][patch][] = "http://www.drupal.org/files/issues/drupal-too_many_connections-930876-160.patch"
libraries[jquery.ui][directory_name] = "jquery.ui"
libraries[jquery.ui][download][type] = "get"
libraries[jquery.ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery-ui-1.8.17.zip"
libraries[SolrPhpClient][destination] = modules/apachesolr
libraries[SolrPhpClient][directory_name] = "SolrPhpClient"
libraries[SolrPhpClient][download][type] = "get"
libraries[SolrPhpClient][download][url] = "http://solr-php-client.googlecode.com/files/SolrPhpClient.r22.2009-11-09.tgz"
projects[acl][version] = "1.1"
projects[admin_menu][version] = "3.0-rc5"
projects[adminrole] = "1.1"
projects[advanced_help][version] = "1.3"
projects[apachesolr][version] = "1.8"
projects[apachesolr_attachments][version] = "1.4"
projects[auto_nodetitle][patch][] = "http://www.drupal.org/files/issues/auto_nodetitle-custom-date-tokens-1197278-51.patch"
projects[auto_nodetitle][version] = "1.0"
projects[computed_field][version] = "1.1"
projects[content_access][version] = "1.2-beta2"
projects[ctools][version] = "1.9"
projects[date][version] = "2.9"
projects[date_repeat_entity][version] = "2.0"
projects[devel][version] = "1.5"
projects[entity][version] = "1.7"
projects[entityreference][version] = "1.1"
projects[entityreference_prepopulate][version] = "1.6"
projects[facetapi][version] = "1.5"
projects[features][version] = "2.7"
projects[features_extra][version] = "1.0"
projects[feeds][version] = "2.0-beta2"
projects[feeds_tamper][version] = "1.1"
projects[file_checker][version] = "1.2"
projects[filefield_sources][version] = "1.10"
projects[fpa][version] = "2.6"
projects[globalredirect][version] = "1.5"
projects[ip_login][version] = "2.0"
projects[job_scheduler][version] = "2.0-alpha3"
projects[jquery_update][version] = "2.7"
projects[libraries][version] = "2.2"
projects[link][version] = "1.4"
projects[media][version] = "1.5"
projects[module_filter][version] = "2.0"
projects[mollom][version] = "2.15"
projects[nodeaccess_nodereference] = "1.22"
projects[page_title][version] = "2.7"
projects[pathauto][version] = "1.3"
projects[prepopulate][version] = "2.1"
projects[redirect][version] = "1.0-rc3"
projects[references][version] = "2.1"
projects[replicate][version] = "1.1"
projects[role_export][version] = "1.0"
projects[rules][version] = "2.9"
projects[seanews-library-cornell-edu-features][download][branch] = "master"
projects[seanews-library-cornell-edu-features][download][type] = "git"
projects[seanews-library-cornell-edu-features][download][url] = "git@github.com:cul-it/seanews-library-cornell-edu-features.git"
projects[seanews-library-cornell-edu-features][type] = "module"
projects[seanews][branch] = "master"
projects[seanews][directory_name] = "seanews"
projects[seanews][download][type] = "git"
projects[seanews][download][url] = "git@github.com:cul-it/seanews.git"
projects[seanews][type] = "module"
projects[simplesaml_authentication_cul][download][branch] = "master"
projects[simplesaml_authentication_cul][download][type] = "git"
projects[simplesaml_authentication_cul][download][url] = "git@github.com:cul-it/simplesaml-module.git"
projects[simplesaml_authentication_cul][type] = "module"
projects[simplesamlphp_auth][version] = "2.0-alpha2"
projects[site_maintenance_block][download][branch] = "master"
projects[site_maintenance_block][download][type] = "git"
projects[site_maintenance_block][download][url] = "git@github.com:cul-it/site-maintenance-module.git"
projects[site_maintenance_block][type] = "module"
projects[skeletontheme][version] = "1.4"
projects[strongarm][version] = "2.0"
projects[taxonomy_manager][version] = "1.0"
projects[token][version] = "1.6"
projects[transliteration][version] = "3.2"
projects[uuid][version] = "1.0-beta1"
projects[uuid_features][version] = "1.0-alpha4"
projects[views][version] = "3.13"
projects[views_bulk_operations][version] = "3.3"
projects[views_data_export][version] = "3.0-beta9"
projects[webform][version] = "4.12"
projects[wysiwyg][version] = "2.2"
