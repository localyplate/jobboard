<?php

require_once '_config/config.php';

// 時間を設定
$schedule = array(
    'spotlight' => array('10', '00'),
);

foreach ($schedule as $key => $item) {
    foreach ($item as $value) {
        //
        $time = date('H');
        // Spotlight job
        switch ($key) {
            case 'spotlight':
                //
                if ($time == $value) {
                    //
                    $job = new Job();
                    $job->SpotlightCronUpdate();
                    //
                    echo '●2週間以上前の値を持つデータのspotlightを0に更新しました。';
                }
                break;
        }
    }
}