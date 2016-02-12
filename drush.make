;; drush make file for seanews
;;

core = 7.x
api = 2
projects[drupal][version] = "7.42"
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
projects[autosave][version] = "2.2"
projects[autoupload][version] = "1.0"
projects[captcha][version] = "1.3"
projects[cck][version] = "3.0-alpha3"
projects[ckeditor][version] = "1.16"
projects[computed_field][version] = "1.1"
projects[content_access][version] = "1.2-beta2"
projects[content_taxonomy][version] = "1.0-beta2"
projects[context][version] = "3.6"
projects[css_injector][version] = "1.10"
projects[ctools][version] = "1.9"
projects[date][version] = "2.9"
projects[date_repeat_entity][version] = "2.0"
projects[ddf][version] = "1.8"
projects[devel][version] = "1.5"
projects[email][version] = "1.3"
projects[emfield][version] = "1.0-alpha2"
projects[entity][version] = "1.6"
projects[entityreference][version] = "1.1"
projects[entityreference_prepopulate][version] = "1.6"
projects[eva][version] = "1.2"
projects[facetapi][version] = "1.5"
projects[features][version] = "2.7"
projects[features_extra][version] = "1.0"
projects[feeds][version] = "2.0-beta1"
projects[feeds_tamper][version] = "1.1"
projects[file_checker][version] = "1.0"
projects[filefield_sources][version] = "1.10"
projects[globalredirect][version] = "1.5"
projects[imageapi][version] = "1.x-dev"
projects[imce][version] = "1.9"
projects[imce_filefield][version] = "1.1"
projects[imce_wysiwyg][version] = "1.0"
projects[ip_login][version] = "2.0"
projects[job_scheduler][version] = "2.0-alpha3"
projects[jquery_update][version] = "2.7"
projects[libraries][version] = "2.2"
projects[link][version] = "1.4"
projects[media][version] = "1.5"
projects[menu_breadcrumb][version] = "1.6"
projects[mimedetect][patch][] = "http://www.drupal.org/files/mimedetect-magic.patch"
projects[mimedetect][version] = "1.0-beta1"
projects[module_filter][version] = "2.0"
projects[mollom][version] = "2.14"
projects[nodeaccess_nodereference] = "1.22"
projects[page_title][version] = "2.7"
projects[pathauto][version] = "1.3"
projects[prepopulate][version] = "2.0"
projects[recaptcha][version] = "1.12"
projects[redirect][version] = "1.0-rc3"
projects[references][version] = "2.1"
projects[replicate][version] = "1.1"
projects[restrict_by_ip][version] = "3.0"
projects[role_export][version] = "1.0"
projects[rules][version] = "2.9"
projects[s3fs][version] = "2.3"
projects[seanews-library-cornell-edu-features][download][branch] = "master"
projects[seanews-library-cornell-edu-features][download][type] = "git"
projects[seanews-library-cornell-edu-features][download][url] = "git@github.com:cul-it/seanews-library-cornell-edu-features.git"
projects[seanews-library-cornell-edu-features][type] = "module"
projects[seanews][branch] = "master"
projects[seanews][directory_name] = "seanews"
projects[seanews][download][type] = "git"
projects[seanews][download][url] = "git@github.com:cul-it/seanews.git"
projects[seanews][type] = "module"
projects[seo_checklist][version] = "4.1"
projects[simplesaml_authentication_cul][download][type] = "get"
projects[simplesaml_authentication_cul][download][url] = "https://featureserver.library.cornell.edu/sites/featureserver.library.cornell.edu/files/fserver/simplesaml_authentication_for_cul-7.x-1.0-rc3.tar"
projects[simplesaml_authentication_cul][location] = "https://featureserver.library.cornell.edu/fserver"
projects[simplesaml_authentication_cul][type] = "module"
projects[simplesamlphp_auth][version] = "2.0-alpha2"
projects[site_map][version] = "1.3"
projects[skeletontheme][version] = "1.4"
projects[strongarm][version] = "2.0"
projects[taxonomy_manager][version] = "1.0"
projects[token][version] = "1.6"
projects[transliteration][version] = "3.2"
projects[uiplog][version] = "1.0-beta2"
projects[userprotect][version] = "1.2"
projects[uuid][version] = "1.0-beta1"
projects[uuid_features][version] = "1.0-alpha4"
projects[views][version] = "3.13"
projects[views_bulk_operations][version] = "3.3"
projects[views_data_export][version] = "3.0-beta9"
projects[views_php][version] = "1.0-alpha1"
projects[webform][version] = "4.12"
projects[wysiwyg][version] = "2.2"
projects[xmlsitemap][patch][] = "http://www.drupal.org/files/issues/xmlsitemap.module.php_.patch"
projects[xmlsitemap][version] = "2.2"
projects[zen][version] = "5.5"
