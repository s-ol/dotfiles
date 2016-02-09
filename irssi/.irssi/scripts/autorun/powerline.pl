use Irssi;
use Irssi::TextUI;

sub draw_powerline_r {
    my ($sb_item, $get_size_only) = @_;
    my $out = qx(powerline shell right);

    $sb_item->default_handler($get_size_only, "$out", '', 0);
}

sub draw_powerline_l {
    my ($sb_item, $get_size_only) = @_;
    my $out = qx(powerline irssi left);

    $sb_item->default_handler($get_size_only, "$out", '', 0);
}

Irssi::statusbar_item_register ('powerline_l', 0, 'draw_powerline_l');
Irssi::statusbar_item_register ('powerline_r', 0, 'draw_powerline_r');
