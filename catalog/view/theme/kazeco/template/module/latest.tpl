<div id="middle_cont" class="container">
  <div class="row">
    <h2>Новые поступления</h2>
    <div id="middle_slider">
      <?php foreach ($products as $product): ?>

      <div>
        <div class="img_cont <?php if($product['recommended']){ echo 'recommended'; }?>" style="background-image: url(' <?php echo $product['thumb'] ?> ')"></div>
        <span class="decr"><?php echo $product['name'] ?></span>
        <span class="name"><?php echo $product['description'] ?></span>
        <span class="price"><?php echo $product['price'] ?>сом</span>
        <div class="hidden_hover">
          <h3><?php echo $product['name']; ?></h3>
          <table >
            <tbody>
            <?php foreach ($product['attributes'] as $atr): ?>
            <?php foreach ($atr['attribute'] as $inside): ?>
            <tr>
              <td><?php echo $inside['name'];?>:</td>
              <td><?php echo $inside['text'];?></td>
            </tr>
            <?php endforeach; ?>
            <?php endforeach; ?>
            </tbody>
          </table>
          <div class="callback"><a href="<?php echo $product['href'] ?>"><span>Обратный звонок</span></a></div>
        </div>
      </div>

      <?php endforeach; ?>
    </div>
  </div>
</div>