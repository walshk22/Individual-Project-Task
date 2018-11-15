

import Data.Text(Text)
import Yesod

instance toJson UserRepos where
    toJson UserRepos {..} = object
          [ "RepoName" .= repoName ]
module Main  where

import qualified Github.Repos as Github
import Data.List
import Data.Maybe

mainListUserRepos = do
  possibleRepos <- Github.userRepos "walshk22" Github.Owner
  case possibleRepos of
       (Left error)  -> putStrLn $ "Error: " ++ (show error)
       (Right repos) -> putStrLn $ intercalate "\n\n" $ map formatRepo repos

formatRepo repo =
  (Github.repoName repo) ++ "\t" ++
    (fromMaybe "" $ Github.repoDescription repo) ++ "\n" ++
    (Github.repoHtmlUrl repo) ++ "\n" ++
    (fromMaybe "" $ Github.repoCloneUrl repo) ++ "\t" ++
    (formatDate $ Github.repoUpdatedAt repo) ++ "\n" ++
    formatLanguage (Github.repoLanguage repo) ++
    "watchers: " ++ (show $ Github.repoWatchers repo) ++ "\t" ++
    "forks: " ++ (show $ Github.repoForks repo)

formatDate (Just date) = show . Github.fromDate $ date
formatDate Nothing = ""

formatLanguage (Just language) = "language: " ++ language ++ "\t"
formatLanguage Nothing = ""{-# LANGUAGE OverloadedStrings #-}
module UserInfo (main) where

import Common
import Prelude ()

import Data.Maybe (fromMaybe)

import qualified GitHub
import qualified GitHub.Endpoints.Users as GitHub

main :: IO ()
main = do
  auth <- getAuth
  possibleUser <- GitHub.userInfoFor' auth "mike-burns"
  putStrLn $ either (("Error: " <>) . tshow) formatUser possibleUser

formatUser :: GitHub.User -> Text
formatUser user =
  (formatName userName login) <> "\t" <> (fromMaybe "" company) <> "\t" <>
    (fromMaybe "" location) <> "\n" <>
    (fromMaybe "" blog) <> "\t" <> "<" <> (fromMaybe "" email) <> ">" <> "\n" <>
    GitHub.getUrl htmlUrl <> "\t" <> tshow createdAt <> "\n" <>
    "hireable: " <> formatHireable (fromMaybe False isHireable) <> "\n\n" <>
    (fromMaybe "" bio)
  where
    userName = GitHub.userName user
    company = GitHub.userCompany user
    location = GitHub.userLocation user
    blog = GitHub.userBlog user
    email = GitHub.userEmail user
    htmlUrl = GitHub.userHtmlUrl user
    createdAt = GitHub.userCreatedAt user
    bio = GitHub.userBio user

formatName :: Maybe Text -> GitHub.Name GitHub.User -> Text
formatName Nothing login = GitHub.untagName login
formatName (Just name) user = name <> "(" <> GitHub.untagName login <> ")"

formatHireable :: Bool -> Text
formatHireable True = "yes"
formatHireable False = "no"