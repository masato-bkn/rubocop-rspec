# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::FromToOrder do
  it 'registers an offense when using change matcher for to - from order' do
    expect_offense(<<~RUBY)
      expect { subject }.to change { Foo }.to(2).from(1)
                                          ^^^^^^^^^^^^^^ Order from - to in change matcher.
    RUBY
  end

  it 'does not register an offense when using change matcher for from - to order' do
    expect_no_offenses(<<~RUBY)
      expect { subject }.to change { Foo }.from(1).to(2)
    RUBY
  end
end
