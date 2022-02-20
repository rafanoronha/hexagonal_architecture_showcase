defmodule Showcase.PrimaryAdapters.Schedule.TweetsLikedByJoseValimBatchWorker do
  use Oban.Worker,
    queue: :tweets_liked_by_jose_valim_batch,
    max_attempts: 1

  import Showcase.{
    Controllers.TweetsLikedByJoseValimBatchController
  }

  def perform(%Oban.Job{
        args: %{}
      }) do
    tweets_liked_by_jose_valim_batch(fetch_credentials)
  end

  defp fetch_credentials do
    nil
  end
end
