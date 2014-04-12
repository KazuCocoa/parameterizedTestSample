# coding: utf-8
require 'rspec-parameterized'
require 'rantly'

require './calculator'


## QuickCheck with Rantly
describe 'example' do
#  let(:num_int1) { Rantly { sized(10) { integer } } }
#  let(:num_int2) { Rantly { sized(10) { integer } } }
  let(:num_int1) { Rantly { integer } }
  let(:num_int2) { Rantly { integer } }
  let(:num_int3) { num_int1 + num_int2 }

  it 'num1 plus num2 is answer' do
    expect(Calculator.calculator('plus', num_int1, num_int2)).to eq num_int3
  end
end

## parameterized test
describe '.calculator arithmetic, num1, num2' do
  where_table(:arithmetic, :num1, :num2, :expect_value) do
       'plus' | 1      | 2      | 3
       'sub'  | 2      | 1      | 1
       'plus' | [1, 2] | [3, 4] | [1, 2, 3, 4]
       'sub'  | [1, 2] | [1]    | [2]
  end
 
  with_them do
    it { expect(Calculator.calculator(arithmetic, num1, num2)).to eq expect_value }
  end
end

## pure RSpec
describe '.calculator arithmetic, num1, num2' do

  it 'num1 plus num2 is answer' do
    expect(Calculator.calculator('plus', 1, 2)).to eq 3
  end

  it 'num1 sub num2 is answer' do
    expect(Calculator.calculator('sub', 2, 1)).to eq 1
  end

  it 'array of num1 plus array of num2 is answer' do
    expect(Calculator.calculator('plus', [1, 2], [3, 4])).to eq [1, 2, 3, 4]
  end

  it 'array of num1 sub array of num2 is answer' do
    expect(Calculator.calculator('sub', [1, 2], [1])).to eq [2]
  end

end