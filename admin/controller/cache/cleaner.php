<?php

class ControllerCacheCleaner extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('cache/cleaner');
        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');
        $data['entry_header'] = $this->language->get('entry_header');
        $data['text_mode'] = $this->language->get('text_mode');
        $data['text_vqcache'] = $this->language->get('text_vqcache');
        $data['text_occache'] = $this->language->get('text_occache');
        $data['text_system'] = $this->language->get('text_system');
        $data['text_image'] = $this->language->get('text_image');
        $data['button_clear'] = $this->language->get('button_clear');
        $data['button_clearlog'] = $this->language->get('button_clearlog');
        $data['button_clearef'] = $this->language->get('button_clearef');

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } elseif (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data['token'] = $this->session->data['token'];
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('cache/cleaner', 'token=' . $this->session->data['token'], 'SSL')
        );

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $this->redirect($this->url->link('cache/cleaner', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['action'] = $this->url->link('cache/cleaner', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('cache/cleaner', 'token=' . $this->session->data['token'], 'SSL');
        $data['mod_cache'] = 'vqmod/mods.cache';
        $data['mod_vqcache'] = 'vqmod/vqcache';
        $data['mod_system'] = 'system/cache,system/storage/cache';
        $data['mod_image'] = 'image/cache';
        $data['refresh'] = $this->url->link('extension/modification/refresh', 'cachecleaner&token=' . $this->session->data['token'], 'SSL');
        $data['clearlog'] = $this->url->link('extension/modification/clearlog', 'cachecleaner&token=' . $this->session->data['token'], 'SSL');
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('cache/cleaner.tpl', $data));
    }

    public function delete() {
        $this->language->load('cache/cleaner');
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $is_file = $this->request->post['is_file'];
            if ($is_file) {
                $this->_deleteFile();
            } else {
                $dirs = explode(',', $this->request->post['file']);
                foreach ($dirs as $dir) {
                    $this->request->post['file'] = $dir;
                    $this->_truncateDir();
                }
            }
            $data['error'] = $this->language->get('text_success');
            $data['type'] = "success";
            echo json_encode($data);
            $this->session->data['success'] = $this->language->get('text_success');
        }
    }

    private function _deleteFile() {
        $this->language->load('cache/cleaner');
        $file = $this->request->post['file'];
        $full_path = DIR_CATALOG . $file;
        $full_path = str_replace('/catalog', '', $full_path);
        if (is_writable($full_path)) {
            file_exists($full_path);
            unlink($full_path);
        } else {
            echo $file . ' ' . $this->language->get('text_notwritable');
        }
    }

    private function _truncateDir($dir = '') {
        if (empty($dir)) {
            $dir = $this->request->post['file'];
            $full_path = DIR_CATALOG . $dir;
            $full_path = str_replace('/catalog', '', $full_path);
        } else {
            $full_path = $dir;
        }
        $files = glob($full_path . '/*');
        
        foreach ($files as $file) {
            if (is_file($file)) {
                if (!stripos($file, 'index.') && !stripos($file, '.gitignore') && !stripos($file, '.hgignore') && !stripos($file, '.htaccess')) {
                    unlink($file);
                }
            } else {
                $this->_truncateDir($file);
                @rmdir($file);
            }
        }
    }
}
