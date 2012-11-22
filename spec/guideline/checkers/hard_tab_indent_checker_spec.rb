require "spec_helper"

module Guideline
  describe HardTabIndentChecker do
    describe "#check" do
      let(:checker) do
        described_class.new
      end

      let(:path) do
        mock(:each_line => content.each_line)
      end

      context "when there is hard tab indent" do
        let(:content) do
          <<-EOF
            def foo
            \t1
            end
          EOF
        end

        specify "checker detects error" do
          checker.check(path)
          checker.should have_error
        end
      end

      context "when there is no too long line" do
        let(:content) do
          <<-EOF
            def foo
              1
            end
          EOF
        end

        specify "checker does not detect error" do
          checker.check(path)
          checker.should_not have_error
        end
      end
    end
  end
end
