<?php echo $header; ?>
<div class="container-fluid" id="top">
  <?php echo $column_left; ?>

  <div id="slider_top">
    <div class="slick_cont" style="background-image: url('media/app//img/123.jpg')">
      <div class="col-sm-4 col-sm-offset-8 col-md-4 col-md-offset-8">
        <h2>Navien</h2>
        <span class="goods_info">ace atmo</span>
        <p>Отопительные котлы</p>
        <a href="#" class="more"><span>Подробнее</span></a>
      </div>
    </div>
    <div class="slick_cont" style="background-image: url('media/app/img/321.jpg')">
      <div class="col-sm-4 col-sm-offset-8 col-md-4 col-md-offset-8">
        <h2>Lorem</h2>
        <span class="goods_info">ace atmo</span>
        <p>Отопительные котлы</p>
        <a href="#" class="more"><span>Подробнее</span></a>
      </div>
    </div>
    <div class="slick_cont" style="background-image: url('media/app/img/123.jpg')">
      <div class="col-sm-4 col-sm-offset-8 col-md-4 col-md-offset-8">
        <h2>Impsum</h2>
        <span class="goods_info">ace atmo</span>
        <p>Отопительные котлы</p>
        <a href="#" class="more"><span>Подробнее</span></a>
      </div>
    </div>
  </div>

  <form id="serach_form" method="post">
    <input class="search_query" type="text" placeholder="поиск" name="search_query">
    <input class="search_submit" type="submit" value="" name="search_submit">
  </form>
</div>

<div class="container" id="mid_cont_one">
  <div class="row">
    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 left">
      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 cat_cont">
        <?php for( $i=0 ; $i < 3; $i++):?>
          <a href="<?php if(isset($categories[$i]['href'])) echo $categories[$i]['href']; ?>"><h3 style="background-image: url('<?php if(isset($categories[$i]['thumb'])) echo $categories[$i]['thumb']; ?>')"><span><?php if(isset($categories[$i]['name'])) echo $categories[$i]['name']; ?></span></h3></a>
        <?php endfor; ?>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 cat_cont">
        <?php for( $i=3 ; $i < 6; $i++):?>
        <a href="<?php if(isset($categories[$i]['href'])) echo $categories[$i]['href']; ?>"><h3 style="background-image: url('<?php if(isset($categories[$i]['thumb'])) echo $categories[$i]['thumb']; ?>')"><span><?php if(isset($categories[$i]['name'])) echo $categories[$i]['name']; ?></span></h3></a>
        <?php endfor; ?>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 cat_cont">
        <?php for( $i = 6 ; $i < 9; $i++):?>
        <a href="<?php if(isset($categories[$i]['href'])) echo $categories[$i]['href']; ?>"><h3 style="background-image: url('<?php if(isset($categories[$i]['thumb'])) echo $categories[$i]['thumb']; ?>')"><span><?php if(isset($categories[$i]['name'])) echo $categories[$i]['name']; ?></span></h3></a>
        <?php endfor; ?>
      </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 right">
      <h2>О компании</h2>
      <p>О компании Kazeco Complex Наша компания Kazeco Complex осуществляет поставку и обслуживание оборудования от мировых заводов производителей, в том числе и от ECOSTAR (Турция) и Oertli-Induflame (Швейцария). Мы занимаемся доставкой оборудования как в Кыргызстан, так и в Казахстан. Если у вас возникли какие либо вопросы, позвоните к нам в офисы в Бишкеке или Алматы. Специалисты нашей компании дадут бесплатные консультации и помогут вам сориентироваться  с выбором оборудования.</p>
      <a href="#" class="more"><span>Подробнее</span></a>
    </div>
  </div>
</div>

<?= $content_top; ?>

<div id="partn_cont" class="container">
  <h2>наши партнеры</h2>
  <div class="col-md-12 col-sm-6 col-md-3 col-lg-3">
    <a href="#"><img src="media/app/img/hyec (4).png" alt="asd"></a>
  </div>
  <div class="col-md-12 col-sm-6 col-md-3 col-lg-3">
    <a href="#"><img src="media/app/img/hyec (1).png" alt="asd"></a>
  </div>
  <div class="col-md-12 col-sm-6 col-md-3 col-lg-3">
    <a href="#"><img src="media/app/img/hyec (2).png" alt="asd"></a>
  </div>
  <div class="col-md-12 col-sm-6 col-md-3 col-lg-3">
    <a href="#"><img src="media/app/img/hyec (3).png" alt="asd"></a>
  </div>
</div>

<div class="container" id="bot_cont">
  <div class="row top_cont">
    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 left">
      <h2>Статьи</h2>
      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 top_news">
        <h3>10 советов по подбору отопительного котла для дома</h3>
        <p>Разнообразный и богатый опыт сложившаяся структура организации позволяет выполнять важные...</p>
      </div>
      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 top_news">
        <h3>Как починить нагреватель воздуха</h3>
        <p>Разнообразный и богатый опыт сложившаяся структура организации позволяет выполнять важные...</p>
      </div>
      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 top_news">
        <h3>Обзор новых теплых полов из Кореи</h3>
        <p>Разнообразный и богатый опыт сложившаяся структура организации позволяет выполнять важные...</p>
      </div>
      <div class="clear"></div>

      <div class="bot_cont">
        <h2>наши <span>проекты</span></h2>
        <a href="#" class="all_subj">Все проекты</a>
        <div class="col-xs-12 col-sm-6 col-md-12 col-lg-6">
          <img src="media/app/img/stasiamba1.jpg" alt="asd">
          <h3>10 советов по подбору отопительного котла для дома</h3>
          <p>Разнообразный и богатый опыт сложившаяся структура организации позволяет выполнять важные...</p>
          <p>Разнообразный и богатый опыт сложившаяся структура организации позволяет выполнять важные...</p>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-12 col-lg-6">
          <img src="media/app/img/stasiamba.jpg" alt="asd">
          <h3>Как починить нагреватель воздуха</h3>
          <p>Разнообразный и богатый опыт сложившаяся структура организации позволяет выполнять важные...</p>
          <p>Разнообразный и богатый опыт сложившаяся структура организации позволяет выполнять важные...</p>
        </div>
      </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 right">
      <h2>Новости</h2>
      <a href="#" class="all_subj">Все новости</a>
      <img src="media/app/img/news.jpg" alt="asd">
      <div class="news_cont">
        <h3>Особенности газовых отопительных котлов</h3>
        <p>Основное направление Kazeco Complex - это продажа всех видов горелок и котлов. Наш основной бренд — ECOSTAR, Турция. Кроме этого, мы имеем в продаже горелки фирмы Oertli-Induflame, Швейцария.
          Наша компания реализует газовые, жидкотопливные, комбинированные и промышленные горелки с диапазоном от 100 кВт до 45 мВт, а также бытовые и промышленные генераторы воздухонагреватели (пушки) и электрические нагреватели. Помимо этого, у нас имеются горелки и портативные теплогенераторы, работающие на отработанном масле.
        </p>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>