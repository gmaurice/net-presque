package Net::Presque;

use MooseX::Net::API;

net_api_declare presque => (
    api_format      => 'json',
    api_format_mode => 'content-type',
);

net_api_method fetch_job => (
    method   => 'GET',
    path     => '/q/:queue_name',
    params   => [qw/queue_name worker_id/],
    required => [qw/queue_name/],
);

net_api_method fetch_jobs => (
    method   => 'GET',
    path     => '/qb/:queue_name',
    params   => [qw/queue_name worker_id batch_size/],
    required => [qw/queue_name/],
);

net_api_method create_job => (
    method        => 'POST',
    strict        => 0,
    path          => '/q/:queue_name',
    params_in_url => [qw/delayed uniq/],
    params        => [qw/queue_name/],
    required      => [qw/queue_name/],
);

net_api_method create_jobs => (
    method        => 'POST',
    strict        => 0,
    path          => '/qb/:queue_name',
    params_in_url => [qw/delayed/],
    params        => [qw/queue_name jobs/],
    required      => [qw/queue_name jobs/],
);

net_api_method reset_queue => (
    method   => 'DELETE',
    path     => '/q/:queue_name',
    params   => [qw/queue_name/],
    required => [qw/queue_name/],
);

net_api_method failed_job => (
    method   => 'PUT',
    strict   => 0,
    path     => '/q/:queue_name',
    params   => [qw/queue_name/],
    required => [qw/queue_name/],
);

net_api_method queue_info => (
    method   => 'GET',
    path     => '/j/:queue_name',
    params   => [qw/queue_name/],
    required => [qw/queue_name/],
);

net_api_method queue_status => (
    method   => 'GET',
    path     => '/control/:queue_name',
    params   => [qw/queue_name/],
    required => [qw/queue_name/],
);

net_api_method change_queue_status => (
    method   => 'POST',
    path     => '/control/:queue_name',
    params   => [qw/queue_name/],
    required => [qw/queue_name/],
);

net_api_method queue_size => (
    method   => 'GET',
    path     => '/status/:queue_name',
    params   => [qw/queue_name/],
    required => [qw/queue_name/],
);

net_api_method worker_stats => (
    method   => 'GET',
    path     => '/w/:worker_id',
    params   => [qw/worker_id/],
    required => [qw/worker_id/],
);

net_api_method workers_stats => (
    method => 'GET',
    path   => '/w/',
);

net_api_method queue_stats => (
    method   => 'GET',
    path     => '/w/:queue_name',
    params   => [qw/queue_name/],
    required => [qw/queue_name/],
);

net_api_method register_worker => (
    method   => 'POST',
    path     => '/w/:queue_name',
    params   => [qw/queue_name worker_id/],
    required => [qw/queue_name worker_id/],
);

net_api_method unregister_worker => (
    method   => 'DELETE',
    path     => '/w/:queue_name',
    params   => [qw/queue_name worker_id/],
    required => [qw/queue_name worker_id/],
);

1;
