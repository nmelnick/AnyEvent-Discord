use v5.14;
use warnings;

package AnyEvent::Discord {
  use Zydeco;

  class Payload {
    use JSON qw(decode_json encode_json);

    type_name Payload;

    has op ( isa => Num );
    has d;
    has s;
    has t;

    coerce from Str via from_json;

    method from_json(Str $json) {
      $class->new(decode_json($json));
    }

    coerce from HashRef via from_hashref;

    method from_hashref(HashRef $ref) {
      $class->new($ref);
    }

    method as_json() {
      return encode_json({
        op => $self->op,
        d  => $self->d,
      });
    }
  }

}

1;

=pod

=head1 NAME

AnyEvent::Discord::Payload - Represents a Discord payload

=head1 DESCRIPTION

https://discord.com/developers/docs/topics/gateway

=head1 ACCESSORS

=over 4

=item op (Number)

Opcode

=item d (HashRef)

Data structure for message

=item t (String)

Event name

=back

=head1 CAVEATS

This is incredibly unfinished.

=head1 AUTHOR

Nick Melnick <nmelnick@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2021, Nick Melnick.

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.

=cut
