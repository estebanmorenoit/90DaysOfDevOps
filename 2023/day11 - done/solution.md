# #90DaysOfDevOps Challenge - Day 11 - Advanced Git & GitHub for DevOps Engineers Part 2

Welcome to Day 11 of the #90DaysOfDevOps challenge. In today's continuation of our exploration of Git, we will dive deeper into advanced techniques such as stashing, cherry-picking and conflict resolution. These techniques play a vital role in ensuring efficient collaboration and effective version control in software development.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685809978906/649c2771-4a3d-40e4-8e69-b73bd7d21d9e.png)

## Git Stash: Saving Changes for Later

`Git stash` is a handy command that allows you to temporarily save changes you've made in your working directory without committing them. This comes in handy when you need to switch to a different branch to work on a separate task but want to keep your current changes.

To use `Git stash`, create a new branch and make some changes. Then, by running `git stash`, you can save those changes. This action removes the changes from your working directory and stores them in a new stash. You can view your stashed changes using `git stash list` and delete specific stashes with `git stash drop`. If you want to clear all stashes, use `git stash clear`.

## Cherry-Pick: Selective Commits

`Git cherry-pick` is a powerful command that allows you to choose specific commits from one branch and apply them to another. This technique is useful when you only want to incorporate specific changes from one branch into another, without merging the entire branch.

To cherry-pick commits, create two branches and make commits to each of them. Then, using `git cherry-pick <commit>`, you can select the specific commits you want to apply from one branch to the other. This provides fine-grained control over which changes are included in your target branch.

## Resolving Conflicts: Bridging the Gap

Conflicts can arise when merging or rebasing branches that have diverged. Resolving conflicts is a crucial skill in Git, and Git provides helpful commands to streamline the process.

When conflicts occur, use `git status` to identify the files with conflicts. By running `git diff`, you can examine the differences between the conflicting versions, helping you understand the conflicting lines. To resolve conflicts, manually edit the conflicted files, keeping the desired changes and removing the conflict markers. After resolving conflicts, use `git add` to stage the resolved files. This informs Git that the conflicts have been resolved and allows the merge or rebase process to proceed smoothly.

## Task 1: Stashing and Applying Changes

In this task, we will work with branches and use the `git stash` command to save changes without committing them. Follow the steps below:

1. Create a new branch using the command:
    
    ```bash
    git checkout -b day11
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685887203574/36d56347-6953-4124-9b7c-fcd283c26dea.jpeg)
    
2. Make some changes to the files in this branch.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685887255296/b5a2ccbf-89ec-42f9-b347-d34a7976aefd.jpeg)
    
3. Use `git stash` to save the changes without committing them:
    
    ```bash
    git stash
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685887306416/7e3abe7d-42d5-4bac-9983-9e5a6133820f.jpeg)
    
4. Switch to the `main` branch using the command:
    
    ```bash
    git checkout main
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685887335482/27ab6e75-30f9-4cb9-9b13-c9d56d9f4a64.jpeg)
    
5. Make some changes to the files in the new branch and commit them.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685887366017/6546ce7c-4f94-4319-9f2f-27d9a8d2ee58.jpeg)
    
6. Use `git stash pop` to bring back the changes you stashed and apply them on top of the new commits:
    
    ```bash
    git stash pop
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685887414684/90016d0f-5bf1-4e00-ad61-ef2163cdf4b1.jpeg)
    

## Task 2: Rebase and Commit Messages

In this task, we will work with the `version01.txt` file in the development branch and perform a rebase operation. Follow the steps below:

1. Open the `version01.txt` file in the development branch.
    
2. Add the following lines after "This is the bug fix in the development branch" that you added on Day 10 and reverted to this commit:
    
    ```bash
    After bug fixing, this is the new feature with minor alteration
    ```
    
3. Commit this change with the message "Added feature2.1 in the development branch."
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685888443984/3c814878-51e9-42e7-8a37-4ef7c77c70bc.jpeg)
    
4. Add the following line after the previous commit:
    
    ```bash
    This is the advancement of the previous feature
    ```
    
5. Commit this change with the message "Added feature2.2 in the development branch."
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685888523681/9ef23f9b-c0fc-40d9-a946-fa05ae3373ee.jpeg)
    
6. Add the following line after the previous commit:
    
    ```bash
     Feature 2 is completed and ready for release
    ```
    
7. Commit this change with the message "Feature2 completed."
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685888601605/88c31369-623a-476d-ba94-80ee733c300f.jpeg)
    
8. Switch to the `main` branch and use `git rebase` to add all the commits from the `dev` branch into the `main` branch
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685888777553/47c872f2-b315-4948-a1b0-3747edc14623.jpeg)
    

## Task 3: Cherry-picking and Optimizing Features

In this task, we will cherry-pick a specific commit from one branch to another and make further changes to it. Follow the steps below:

1. Switch to the `production` branch.
    
2. Cherry-pick the commit "Added feature2.2 in development branch" using the command:
    
    ```bash
    git cherry-pick <commit-hash>
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685889710485/527d74b6-f4f6-43f0-9d33-a91556a019c3.jpeg)
    
3. Add the following lines after "This is the advancement of the previous feature":
    
    ```bash
    Added few more changes to make it more optimized.
    ```
    
4. Commit this change with the message "Optimized the feature."
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685889737719/10cead93-c05c-4eba-976b-e96423ff72a7.jpeg)
    

Congratulations on completing Day 11 of the #90DaysOfDevOps challenge! Today, we explored advanced Git techniques such as stashing, cherry-picking, and rebasing. These techniques are powerful tools in managing changes and collaborating effectively within Git repositories.

Stay tuned for Day 12 of the #90DaysOfDevOps challenge, where we will wrap up our Linux and Git session, diving deeper into their features and techniques that will serve as a strong foundation for our next adventure with Python from Day 13.