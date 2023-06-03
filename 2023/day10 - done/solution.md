# #90DaysOfDevOps Challenge - Day 10 - Advanced Git & GitHub for DevOps Engineers Part 1
## Git Branching

Welcome to Day 10 of the #90DaysOfDevOps challenge. Today, we will explore advanced Git techniques, including branching, merging, and reverting. These techniques are essential for effective collaboration and version control in software development projects. So, let's dive in.

## Git Branching

Git branching is a feature in Git that allows you to create separate lines of development within a repository. It enables you to work on different features or fixes simultaneously without affecting the main codebase.

Branches serve as independent workspaces where you can make changes, commit them, and merge them back into the main branch when ready. They provide a way to organize and manage different versions or streams of code within a project.

## Git Revert and Reset

`Git revert` is a command that undoes a specific commit by creating a new commit that undoes the changes made in that commit. It is a safe way to undo changes without altering the commit history.

`Git reset` is a command that allows you to move the branch pointer to a different commit. It can be used to reset the branch to a previous state. However, it should be used with caution as it can discard or modify changes in the process.

In simple terms, `git revert` undoes a commit by creating a new one, while `git reset` moves the branch pointer to a different commit.

## Git Rebase and Merge

### What Is Git Rebase?

`Git rebase` is a command that allows you to update your branch with the latest changes from another branch. It rearranges the commit history by moving your changes on top of the updated branch. This helps create a cleaner and more straightforward history of your changes. It's useful for integrating changes, keeping your branch up to date, and making your commit history more organized before merging.

### What Is Git Merge?

`Git merge` is a command that combines changes from different branches into a single branch. It takes the changes made in one branch and integrates them into another branch, creating a new commit that includes the changes from both branches. It's used to incorporate the work done in one branch into another, such as merging a feature branch into a main branch. The merge operation keeps a record of the individual branch histories and combines them into a unified branch history.

Refer to this article for a better understanding of Git Rebase and Merge [Read here](https://www.simplilearn.com/git-rebase-vs-merge-article)

## Task 1: Branching, Committing, and Restoring

In this task, we will demonstrate how to create a branch, add commits with different messages, and restore a file to a previous version. Follow the steps below:

1. Create a branch called `dev` from the `main` branch using the command:
    
    ```bash
    git branch dev
    git checkout dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685795641349/f159dcd3-ddc8-4ecd-8b08-b785f0af3c9e.jpeg align="center")
    
2. Add a text file called `version01.txt` inside the `Devops/Git/` directory. Write the following content inside the file:
    
    ```bash
    "This is the first feature of our application."
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685795735828/f7e290c6-9300-44bc-98c4-90fbe0130ca9.jpeg align="center")
    
3. Commit this change with the message "Added new feature."
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685796208817/477c3976-520a-4294-a528-8449fa8802b7.jpeg align="center")
    
4. Push the `dev` branch to the remote repository using the command:
    
    ```bash
    git push origin dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685796264145/fe62bcba-752b-45c6-94ec-c9188de346f1.jpeg align="center")
    
5. Add new commits to the `dev` branch by modifying the `version01.txt` file with the following content:
    
    ```bash
    This is the bug fix in the development branch
    ```
    
6. Commit this change with the message
    
    ```bash
    "Added feature2 in the development branch."
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685797001577/40cd1af3-c620-40d0-b346-55794ddde9c4.jpeg align="center")
    
7. Repeat this step two more times, adding the following content and committing with appropriate messages:
    
    ```bash
    This is gadbad code
    ```
    
    ```bash
    This feature will gadbad everything from now.
    ```
    
8. Restore the `version01.txt` file to a previous version where the content should be "This is the bug fix in the development branch."
    
9. Using the `git log --oneline` command, we can find the `<commit>` information and identity the commit you want to reset to.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685806950707/bbb420dd-8aad-4f02-b15d-ba10489b40f8.jpeg align="center")
    
10. We can use the `git reset <commit>` command to remove the last two commits where we added the second and third lines and move the changes to the unstaged area.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685807141176/9256cf9c-d792-451a-a010-90f614caaf2e.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685807174545/dda3b75d-52ef-4670-81fb-1efc5b08c549.jpeg align="center")
    

## Task 2: Branching, Merging, and Rebasing

In this task, we will demonstrate the concept of branches, merging, and rebasing. Follow the steps below:

1. Create two or more branches with different names using the command `git branch`. In this case, I will use `main` and `dev`:
    
    ```bash
    git branch dev
    ```
    
    Make some changes to the `dev` branch and commit them. Take a screenshot of the commit history and branch visualization to demonstrate the concept of branches.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685808019029/64a04bb6-677c-4eba-981d-821838516e09.jpeg align="center")
    
2. Merge the `dev` branch into the `main` branch using the command:
    
    ```bash
    git checkout main
    git merge dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685808127381/cbb761c2-ad5a-4b47-be6d-27a2b8e1ba3d.jpeg align="center")
    
3. As a practice, perform a `git rebase` operation to see the difference it makes. Describe the differences you observe.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685808342043/8a23918a-4043-4bfd-911f-44bb9e23d82d.jpeg align="center")
    

**Merge** preserves the branch structure and creates a new merge commit, while **rebase** rewrites the commit history and provides a linear sequence of commits. The choice between merge and rebase depends on the specific use case, project requirements, and collaboration workflow.

Congratulations on completing Day 10 of the #90DaysOfDevOps challenge. Today, we explored advanced Git techniques, including branching, merging, and reverting. These techniques play a crucial role in efficient collaboration and version control in software development projects.

Stay tuned for Day 11, where we will continue exploring Git and GitHub for DevOps Engineers in the second part of this topic.