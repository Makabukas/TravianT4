<div class="contentNavi tabNavi">
<div <?php if(!isset($_GET['s'])) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="build.php?id=<?php echo $id; ?>"><span class="tabItem">Képzés</span></a></div>
</div>
<div <?php if(isset($_GET['s']) && $_GET['s'] == 2) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="build.php?id=<?php echo $id; ?>&amp;s=2"><span class="tabItem">Kultúrpont</span></a></div>
</div>
<div <?php if(isset($_GET['s']) && $_GET['s'] == 3) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="build.php?id=<?php echo $id; ?>&amp;s=3"><span class="tabItem">Hűség</span></a></div>
</div>
<div <?php if(isset($_GET['s']) && $_GET['s'] == 4) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="build.php?id=<?php echo $id; ?>&amp;s=4"><span class="tabItem">Kiterjeszkedés</span></a></div>
</div><div class="clear"></div>
</div>