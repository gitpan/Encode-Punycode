package Encode::Punycode;

use strict;
use utf8;
use warnings;

our $VERSION = '1.001';
$VERSION = eval $VERSION;

require Encode;
use base qw(Encode::Encoding);
__PACKAGE__->Define('Punycode', 'punycode');

use Net::IDN::Punycode();

sub encode {
  my($self, $string, $check) = @_;
  $string = Net::IDN::Punycode::encode_punycode($string);
  $_[1] = '' if $check;
  return $string;
}

sub decode {
  my($self, $string, $check) = @_;
  $string = Net::IDN::Punycode::decode_punycode($string);
  $_[1] = '' if $check;
  return $string;
}

sub mime_name {
  return undef;
};

sub perlio_ok { 
  return 0;
}

1;
__END__

=head1 NAME

Encode::Punycode - Encode plugin for Punycode (S<RFC 3492>)

=head1 SYNOPSIS

  use Encode;
  $unicode  = decode('Punycode', $punycode);
  $punycode = encode('Punycode', $unicode);

=head1 DESCRIPTION

Encode::Punycode is an Encode plugin, which implements the Punycode encoding.

Punycode is an instance of a more general algorithm called Bootstring, which
allows strings composed from a small set of "basic" code points to uniquely
represent any string of code points drawn from a larger set.  Punycode is
Bootstring with particular parameter values appropriate for IDNA.  For a more
generic (but less efficient) Bootstring implementation, see
L<Encode::Bootstring>.

This module does not do any string preparation or mappings as
specified by Nameprep. It does not do add any prefix or suffix, either.  For
higher-level handling of full Internationalised Domain Names, see
L<Net::IDN::Encode>.

=head1 AUTHOR

Claus FE<auml>rber E<lt>CFAERBER@cpan.orgE<gt>

Previous versions written by Tatsuhiko Miyagawa E<lt>miyagawa@bulknews.netE<gt>

=head1 COPYRIGHT

Copyright 2007-2010 Claus FE<auml>rber.

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 SEE ALSO

L<Encode>, L<Net::IDN::Punycode>, 
S<RFC 3492> (L<http://www.ietf.org/rfc/rfc3492.txt>)

=cut
