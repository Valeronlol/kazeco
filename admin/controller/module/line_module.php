<?php
class ControllerModuleLineModule extends Controller {
    private $error = array();
    private $validation_errors;
    private $saved_data;


    public function __construct(){
        global $registry;
        parent::__construct($registry);

        if(isset($this->session->data['errors']) && $this->session->data['errors'] != NULL){
            $this->validation_errors = $this->session->data['errors'];
            unset($this->session->data['errors']);
        }

        if(isset($this->session->data['saved_data']) && $this->session->data['saved_data'] != NULL){
            $this->saved_data = $this->session->data['saved_data'];
            unset($this->session->data['saved_data']);
        }
    }

    public function index() {
        // Загружаем языковой файл
        $this->load->language('module/line_module');

        $this->document->setTitle($this->language->get('heading_title'));

        // Загружаем модель
        $this->load->model('line/line');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['line_list'] = $this->language->get('line_list');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        /* Хлебные крошки */
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/category', 'token=' . $this->session->data['token'], 'SSL')
        );
        /* Хлебные крошки */

        /* Кнопки управления */
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['manage_line_action'] = $this->url->link('module/line_module/manage', 'token=' . $this->session->data['token'], 'SSL');
        /* Кнопки управления */

        $data['lines'] = $this->model_line_line->getLines();

        /* Шаблон админки */
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        /* Шаблон админки */

        $this->response->setOutput($this->load->view('module/line_module.tpl', $data));
    }

    public function manage(){
        // Загружаем языковой файл
        $this->load->language('module/line_module');

        $this->document->setTitle($this->language->get('heading_title'));

        // Загружаем модель
        $this->load->model('line/line');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['line_list'] = $this->language->get('line_add');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        /* Хлебные крошки */
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/category', 'token=' . $this->session->data['token'], 'SSL')
        );
        /* Хлебные крошки */

        /* Кнопки управления */
        $data['action'] = $this->url->link('module/line_module/manage', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('module/line_module', 'token=' . $this->session->data['token'], 'SSL');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        /* Кнопки управления */

        $line_id = 0;
        $data['line_data'] = array(
            'id'=> '',
            'code'=> '',
            'status'=> '',
            'content'=> ''
        );
        if($this->request->server['REQUEST_METHOD'] == 'GET'){
            if(isset($_GET['delete']) && ($id = (int) $_GET['delete']) != 0){
                $line_data = $this->model_line_line->getLineData($id);
                if(is_array($line_data)){
                    $this->model_line_line->deleteLine($id);
                    $url = $this->url->link('module/line_module', 'token=' . $this->session->data['token'], 'SSL');
                    $this->response->redirect($url);
                }
            }
            if(isset($_GET['id']) && ($id = (int) $_GET['id']) != 0){
                $line_data = $this->model_line_line->getLineData($id);
                if(is_array($line_data)){
                    $data['line_data'] = $line_data;
                    $data['line_list'] = "Редактирование линейки <strong>< {$line_data['code']} ></strong>";
                }
            }
        }

        /* Добавление или редактирование POST */
        if($this->request->server['REQUEST_METHOD'] == 'POST') {
            $code = "";
            $status = 0;
            $content = "";
            if (isset($_POST['code']) && $_POST['code'] != NULL) {
                $code = $_POST['code'];
            }
            if (isset($_POST['status'])) {
                $status = 1;
            }
            if (isset($_POST['content']) && $_POST['content'] != NULL) {
                $content = $_POST['content'];
            }

            $errors = array();

            if (isset($_POST['id']) && ($id = (int)$_POST['id']) != 0) {
                // Проверяем, сущестует ли запись
                $line_data = $this->model_line_line->getLineData($id);
                if (is_array($line_data)) {
                    if ($code == NULL) {
                        $errors['code'] = "Поле код обязательно для заполнения.";
                    } else {
                        if ($code != $line_data['code']) {
                            $line_code_check_result = $this->model_line_line->checkLineCode($code);
                            if ($line_code_check_result) {
                                $errors['code'] = "Код линейки '$code' уже существует, выберите другой.";
                            }
                        }
                    }

                    if ($errors) {
                        $this->session->data['errors'] = $errors;
                        $this->session->data['saved_data'] = array(
                            'id' => $id,
                            'code' => $code,
                            'content' => $content,
                            'status' => $status
                        );
                        $url = $this->url->link('module/line_module/manage', 'token=' . $this->session->data['token'] . "&id=$id", 'SSL');
                        $this->response->redirect($url);
                    }

                    $update_data = array();
                    $update_data['code'] = $code;
                    $update_data['content'] = $content;
                    $update_data['status'] = $status;

                    $this->model_line_line->editLine($id, $update_data);

                    $url = $this->url->link('module/line_module/manage', 'token=' . $this->session->data['token'] . "&id=$id", 'SSL');
                    $this->response->redirect($url);
                }
            } else {
                if ($code == NULL) {
                    $errors['code'] = "Поле код обязательно для заполнения.";
                } else {
                    $line_code_check_result = $this->model_line_line->checkLineCode($code);
                    if ($line_code_check_result) {
                        $errors['code'] = "Код линейки '$code' уже существует, выберите другой.";
                    }
                }

                if ($errors) {
                    $this->session->data['errors'] = $errors;
                    $this->session->data['saved_data'] = array(
                        'id' => $id,
                        'code' => $code,
                        'content' => $content,
                        'status' => $status
                    );
                    $url = $this->url->link('module/line_module/manage', 'token=' . $this->session->data['token'], 'SSL');
                    $this->response->redirect($url);
                }

                $insert_data = array();
                $insert_data['code'] = $code;
                $insert_data['content'] = $content;
                $insert_data['status'] = $status;

                $this->model_line_line->createLine($insert_data);

                $url = $this->url->link('module/line_module', 'token=' . $this->session->data['token'], 'SSL');
                $this->response->redirect($url);
            }
        }
        /* Добавление или редактирование POST */
        $data['validation_errors'] = array();
        if($this->validation_errors){
            $data['validation_errors'] = $this->validation_errors;
        }

        if($this->saved_data){
            $data['line_data'] = $this->saved_data;
        }

        //if(isset($_GET['']))
        //$data['lines'] = $this->model_line_line->getLineData();

        /* Шаблон админки */
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        /* Шаблон админки */

        $this->response->setOutput($this->load->view('module/line_module_manage.tpl', $data));
    }

    public function delete(){

    }

    public function __index() {
        $this->load->language('module/category');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('category', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/category', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['action'] = $this->url->link('module/category', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['category_status'])) {
            $data['category_status'] = $this->request->post['category_status'];
        } else {
            $data['category_status'] = $this->config->get('category_status');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/category.tpl', $data));
    }
}